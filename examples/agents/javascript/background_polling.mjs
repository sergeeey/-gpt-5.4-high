import OpenAI from "openai";

const client = new OpenAI();

const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

async function main() {
  let response = await client.responses.create({
    model: "gpt-5.4",
    background: true,
    reasoning: { effort: "high" },
    input:
      "Analyze this large document set and produce a cited summary of the three most important contradictions."
  });

  console.log("started:", response.id, response.status);

  while (response.status === "queued" || response.status === "in_progress") {
    await sleep(2000);
    response = await client.responses.retrieve(response.id);
    console.log("status:", response.status);
  }

  console.log("final status:", response.status);
  console.log(response.output_text ?? "");
}

main().catch((err) => {
  console.error(err);
  process.exit(1);
});
