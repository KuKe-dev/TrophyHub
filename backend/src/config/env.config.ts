import { loadEnvFile } from "node:process";

loadEnvFile();

const PORT: number  = parseInt(process.env.PORT || "3000", 10);

export { PORT };
