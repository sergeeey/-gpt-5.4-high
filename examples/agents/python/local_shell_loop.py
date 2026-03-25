from openai import OpenAI


client = OpenAI()


def main() -> None:
    response = client.responses.create(
        model="gpt-5.4",
        instructions="The local shell environment is Windows PowerShell.",
        input="Find the largest log file in the current workspace and tell me which command you would run first.",
        tools=[{"type": "shell", "environment": {"type": "local"}}],
    )

    print(response)
    print()
    print("When the model returns shell_call items, execute them locally and send")
    print("shell_call_output back in the next responses.create call.")


if __name__ == "__main__":
    main()
