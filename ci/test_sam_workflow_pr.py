"""Test SAM deployment workflow to changed stacks"""
import os
import utils

ENVIRONMENT = os.environ.get("ENVIRONMENT")
CHANGED_FILES = os.environ.get("CHANGED_FILES", "")


if __name__ == "__main__":
    changed_files = CHANGED_FILES.split()
    changed_sam_stacks = utils.find_sam_stacks_containing_files(changed_files)
    print("Changed stacks: ", changed_sam_stacks)
    for stack in changed_sam_stacks:
        environments = utils.read_environments_in_sam_stack(stack)
        if ENVIRONMENT in environments:
            utils.add_arguments_to_sam_config_file(
                stack,
                sam_build_stage=utils.SamBuildStage.DEPLOY,
                environment=utils.Environment(ENVIRONMENT),
                no_execute_change_set=True,
            )
        utils.apply_sam_workflow_to_stack(
            stack, environment=utils.Environment(ENVIRONMENT)
        )
    print("Complete!")
