/** Decode percent-encoded URLs for display; fall back to the raw value. */
export function decodeUrlForDisplay(url: string): string {
  try {
    return decodeURI(url);
  } catch {
    return url;
  }
}
