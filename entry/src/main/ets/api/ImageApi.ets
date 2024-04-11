import { Post } from '../common/http/Aop';
import { DecodingOptions } from '../common/http/RequestOptions';
import { ImageDLRequest } from './request/ImageDLRequest';

export class ImageApi {
  @Post("https://stg.rakuzen-plus.com/api/image/download")
  getImage(request: ImageDLRequest, option: DecodingOptions): Promise<PixelMap> {
    return
  }
}
export const imageApi = new ImageApi();