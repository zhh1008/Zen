import preferences from '@ohos.data.preferences'
import Logger from './Logger'

class PreferencesUtil {

  preferencesMap: Map<string, preferences.Preferences> = new Map();

  async loadPreference(context, name: string) {
    // Logger.info("PreferencesUtil", `开始加载Preference [${name}]`)
    try {
      let preference = await preferences.getPreferences(context, name);
      this.preferencesMap.set(name, preference);
      // Logger.info("PreferencesUtil", `加载Preference [${name}] 成功`)
      return preference;
    } catch(err) {
      Logger.error("PreferencesUtil", `加载Preference [${name}] 失败`, JSON.stringify(err));
      Promise.reject(`加载Preference [${name}] 失败`)
    }
  }

  // 新增数据put
  async set(key: string, value: preferences.ValueType, name: string = "zenPreference") {
    isPreferencesHas(this.preferencesMap, name)
    try {
      let preference = this.preferencesMap.get(name)
      // 写入数据
      await preference.put(key, value)
      // 刷盘
      await preference.flush()
      // Logger.info("PreferencesUtil", `保存Preference [${name}:${key} =${value}] 成功`)
    } catch (err) {
      Logger.info("PreferencesUtil", `保存Preference [${name}:${key} =${value}] 失败`, JSON.stringify(err))
    }
  }

  // 读取数据get
  async get(key: string, defaultValue: preferences.ValueType, name: string = "zenPreference") {
    isPreferencesHas(this.preferencesMap, name)

    try {
      let preference = this.preferencesMap.get(name)
      const value = await preference.get(key, defaultValue)
      // Logger.info('PreferencesUtil', `读取preferences[${name}:${key}=${value}]成功`)
      return value
    } catch (e) {
      Logger.info('PreferencesUtil', `读取preferences[${name}:${key}]失败`, JSON.stringify(e));
    }
  }

  // 删除数据del
  async delete(key: string, name: string = "zenPreference") {
    isPreferencesHas(this.preferencesMap, name)

    try {
      let preference = this.preferencesMap.get(name)
      await preference.delete(key)
      // Logger.info('PreferencesUtil', `删除preferences[${name}:${key}]成功`)
      // 刷盘
      await preference.flush()
      return
    }
    catch (e) {
      Logger.info('PreferencesUtil', `删除preferences[${name}:${key}]失败`, JSON.stringify(e));
    }
  }
}

const isPreferencesHas = function (preferenceMap: Map<string, preferences.Preferences>, name) {
  try {
    if (!preferenceMap.has(name)) {
      // Logger.error("PreferencesUtil", `Preference[${name}]尚未初始化`);
      Promise.reject(`Preference[${name}]尚未初始化`)
    }
  }
    catch (err) {
      Logger.info('PreferencesUtil', `删除preferences[${name}]失败`, err);
    }
}

const preferenceUtil = new PreferencesUtil()

export default preferenceUtil as PreferencesUtil