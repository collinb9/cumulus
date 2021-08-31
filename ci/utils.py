"""Helper functions for ci"""
import enum
import os
from typing import List
import glob
import subprocess
import toml


class Environment(enum.Enum):

    PROD = "prod"
    STAGING = "staging"
    BASTION = "bastion"


class SamBuildStage(enum.Enum):

    BUILD = "build"
    PACKAGE = "package"
    DEPLOY = "deploy"


def find_sam_stacks_containing_files(
    files: List[str], sam_stack_config_file: str = "samconfig.toml"
):
    """
    Find all SAM stacks which contain any of a collection of files
    """
    changed_file_directories = [os.path.dirname(fpath) for fpath in files]
    sam_config_files = [
        os.path.join(dir_name, sam_stack_config_file)
        for dir_name in changed_file_directories
    ]
    changed_sam_stacks = [glob.glob(fpath) for fpath in sam_config_files]
    changed_sam_stacks = [
        item for sublist in changed_sam_stacks for item in sublist
    ]
    changed_sam_stacks = {
        os.path.dirname(changed_sam_stack)
        for changed_sam_stack in changed_sam_stacks
    }
    return changed_sam_stacks


def find_all_sam_stacks(
    root_dir: str = "./", sam_stack_config_file: str = "samconfig.toml"
):
    """
    Find all SAM stacks
    """
    config_files = glob.glob(
        os.path.join(root_dir, "**", sam_stack_config_file), recursive=True
    )
    return ["/".join(fpath.split("/")[:-1]) for fpath in config_files]


def get_config_for_stack(
    stack: str, sam_stack_config_file: str = "samconfig.toml"
):
    """
    Get the SAM config file for the given stack
    """
    config_file = os.path.join(stack, sam_stack_config_file)
    return config_file


def load_config_for_stack(stack: str, **kwargs):
    """
    Load the SAM config file
    """
    config_file = get_config_for_stack(stack, **kwargs)
    config = toml.load(config_file)
    return config


def read_environments_in_sam_stack(
    stack: str, sam_stack_config_file: str = "samconfig.toml"
):
    """
    Read all of the environments used in the SAM config file for a given stack
    """
    config = load_config_for_stack(
        stack, sam_stack_config_file=sam_stack_config_file
    )
    config.pop("version")
    config.pop("default", None)
    return config.keys()


def add_arguments_to_sam_config_file(
    stack: str,
    sam_stack_config_file: str = "samconfig.toml",
    sam_build_stage: SamBuildStage = SamBuildStage.BUILD,
    environment: Environment = Environment.STAGING,
    **kwargs,
):
    config = load_config_for_stack(
        stack, sam_stack_config_file=sam_stack_config_file
    )
    config[environment.value][sam_build_stage.value]["parameters"].update(
        **kwargs
    )
    config_file = get_config_for_stack(
        stack, sam_stack_config_file=sam_stack_config_file
    )

    with open(config_file, "w+") as fpath:
        toml.dump(config, fpath)


def apply_sam_workflow_to_stack(
    stack: str, environment: Environment = Environment.STAGING
):
    """
    Apply the SAM workflow to a particular stack
    """
    command = [
        os.path.join(
            os.path.dirname(os.path.realpath(__file__)), "sam_workflow.sh"
        ),
        environment.value,
    ]

    environments = read_environments_in_sam_stack(stack)
    if environment.value not in environments:
        print(
            f"Stack {stack} is not configured for the environment {environment.value}"
        )
        print("Continuing")
        return
    try:
        result = subprocess.run(
            command, cwd=stack, check=True, capture_output=True
        )
    except subprocess.CalledProcessError as err:
        stderr = err.stderr.decode("utf-8")
        stdout = err.stdout.decode("utf-8")
        print(stdout)
        print(stderr)
        if "Missing option '--stack-name'" in stderr:
            print(
                "Either no '--stack-name' option, "
                f"or no config env matching '{environment.value}'"
            )
            print("Continuing ...")
        elif "No changes to deploy" in stderr:
            print("No changes to deploy")
            print("\nContinuing ...")
        else:
            print("\nHalting.")
            raise
    else:
        stderr = result.stderr.decode("utf-8")
        stdout = result.stdout.decode("utf-8")
        print(stdout)
        print(stderr)
