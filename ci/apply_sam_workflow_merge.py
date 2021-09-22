"""Apply SAM deployment workflow to all stacks"""
import os
import utils

ENVIRONMENT = os.environ.get("ENVIRONMENT")

if __name__ == "__main__":
    stacks = utils.find_all_sam_stacks()
    print("Stacks to deploy: ", stacks)
    for stack in stacks:
        utils.apply_sam_workflow_to_stack(
            stack,
            environment=utils.Environment(ENVIRONMENT),
        )
    print("Complete!")
