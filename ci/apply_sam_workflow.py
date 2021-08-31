"""Apply SAM deployment workflow to changed stacks"""
import os
import subprocess

ENVIRONMENT = os.environ.get("ENVIRONMENT")
CHANGED_TEMPLATES = os.environ.get("CHANGED_TEMPLATES", "")


if __name__ == "__main__":
    print("CHANGED_TEMPLATES: ", CHANGED_TEMPLATES)
    templates = CHANGED_TEMPLATES.split()
    for template in templates:
        build_directory = os.path.dirname(template)
        print("BUILD_DIRECTORY: ", build_directory)
        command = [
            os.path.join(
                os.path.dirname(os.path.realpath(__file__)), "sam_workflow.sh"
            ),
            ENVIRONMENT,
        ]
        print(command)
        try:
            res = subprocess.run(
                command, cwd=build_directory, check=True, capture_output=True
            )
        except subprocess.CalledProcessError as err:
            stderr = err.stderr.decode("utf-8")
            stdout = err.stdout.decode("utf-8")
            print(stdout)
            print(stderr)
            if "Missing option '--stack-name'" in stderr:
                print(
                    "Either no '--stack-name' option, "
                    f"or no config env matching '{ENVIRONMENT}'"
                )
                print("Continuing ...")
            elif "No changes to deploy" in stderr:
                print("No changes to deploy")
                print("\nContinuing ...")
            else:
                print("\nHalting.")
                raise
