import OpenAI from "openai";

const client = new OpenAI();

async function main() {
  const response = await client.responses.create({
    model: "gpt-5.4",
    reasoning: { effort: "high" },
    text: { verbosity: "medium" },
    input: "Inspect the repository, determine why the target test is failing, use tools as needed, and report Implemented and Verified separately.",
    tools: [
      { type: "shell", environment: { type: "local" } },
      { type: "apply_patch" }
    ]
  });

  console.log(response);
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
