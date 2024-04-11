export interface RequestOptions {
  url?: string;
  method?: RequestMethod;
  extraData?: string|Object|ArrayBuffer;
  queryParams?: Map<string, string>;
  decodingOptions?: DecodingOptions;
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

export class DecodingOptions {
  options?: Object

  constructor(options: Object) {
    this.options = options
  }
}
