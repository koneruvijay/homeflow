// Thin typed client over the HomeFlow REST API (types from @homeflow/contracts).
export function createApiClient(baseUrl: string) {
  return {
    uploadFile: (file: File) => {
      const body = new FormData();
      body.append("file", file);
      return fetch(`${baseUrl}/files`, { method: "POST", body }).then((r) => r.json());
    },
    getFileStatus: (fileId: string) =>
      fetch(`${baseUrl}/files/${fileId}`).then((r) => r.json()),
    chat: (message: string, conversationId?: string) =>
      fetch(`${baseUrl}/chat`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ message, conversationId }),
      }).then((r) => r.json()),
  };
}
