from time import sleep
from openai import OpenAI


client = OpenAI()


def main() -> None:
    resp = client.responses.create(
        model="gpt-5.4",
        input="Analyze this large corpus and produce a cited summary of the three most important contradictions.",
        reasoning={"effort": "high"},
        background=True,
    )

    print("started:", resp.id, resp.status)

    while resp.status in {"queued", "in_progress"}:
        sleep(2)
        resp = client.responses.retrieve(resp.id)
        print("status:", resp.status)

    print("final status:", resp.status)
    print(getattr(resp, "output_text", ""))


if __name__ == "__main__":
    main()
