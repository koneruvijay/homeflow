import { createApiClient } from "@homeflow/ts-common";

export const api = createApiClient(process.env.NEXT_PUBLIC_API_URL ?? "http://localhost:8000");
