"""Apply SAM deployment workflow to changed stacks"""
import os
import subprocess
import utils

subprocess.run(["source", "ci/find_changed_files.sh"], check=True)
ENVIRONMENT = os.environ.get("ENVIRONMENT")
CHANGED_FILES = os.environ.get("CHANGED_FILES")


if __name__ == "__main__":
    print(f"Environment: {ENVIRONMENT}")
    print(f"Changed_files: {CHANGED_FILES}")
    changed_files = CHANGED_FILES.split()
    changed_sam_stacks = utils.find_sam_stacks_containing_files(changed_files)
    print("Changed stacks: ", changed_sam_stacks)
    for stack in changed_sam_stacks:
        utils.apply_sam_workflow_to_stack(
            stack, environment=utils.Environment(ENVIRONMENT)
        )
    print("Complete!")
