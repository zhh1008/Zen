export interface RequestOptions {
  url?: string;
  method?: RequestMethod;
  extraData?: string|Object|ArrayBuffer;
  queryParams?: Map<string, string>;
  header?: Object;
}

export enum RequestMethod {
  OPTIONS = "OPTIONS",
  GET = "GET",
  HEAD = "HEAD",
  POST = "POST",
  PUT = "PUT",
  DELETE = "DELETE",
  TRACE = "TRACE",
  CONNECT = "CONNECT"
}