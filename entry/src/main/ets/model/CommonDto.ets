import Logger from '../common/utils/Logger';

@Observed
export class ObservedArray<T> extends Array<T> {
  constructor(args: T[]) {
    Logger.debug(`ObservedArray:${JSON.stringify(args)}`)
    if (args instanceof Array) {
      super(...args);
    } else {
      super(args)
    }
  }
}