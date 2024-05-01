import { ListItemDto } from '../../model/ListItemDto';
class StringUtils {
  isNullOrEmpty(str?: string) {
    return str == null || str.length == 0;
  }

  convertSexByCode(code: string) {
    if (code == '01') {
      return '男';
    } else if (code == '02') {
      return '女';
    }
    return '';
  }

  convertSexByName(name: string) {
    if (name == '男') {
      return '01';
    } else if (name == '女') {
      return '02';
    }
    return '';
  }

  convertRelationshipByCode(code: string) {
    if (code == '01') {
      return '配偶者';
    } else if (code == '02') {
      return '親';
    } else if (code == '03') {
      return '子';
    } else if (code == '04') {
      return 'その他';
    }
    return '';
  }

  convertRelationshipByName(name: string) {
    if (name == '配偶者') {
      return '01';
    } else if (name == '親') {
      return '02';
    } else if (name == '子') {
      return '03';
    } else if (name == 'その他') {
      return '04';
    }
    return '';
  }

  convertEmploymentContractByCode(code: string) {
    if (code == '01') {
      return '締結済み';
    } else if (code == '02') {
      return '未締結';
    }
    return '';
  }

  convertEmploymentContractByName(name: string) {
    if (name == '締結済み') {
      return '01';
    } else if (name == '未締結') {
      return '02';
    }
    return '';
  }

  convertPeriodStatusByCode(code: string) {
    if (code == '01') {
      return '技能実習3号';
    } else if (code == '02') {
      return '技能実習2号';
    } else if (code == '03') {
      return '技能実習1号';
    } else if (code == '04') {
      return '特定活動(外国人建設就労者)';
    } else if (code == '05') {
      return '特定技能';
    } else if (code == '06') {
      return 'いいえ';
    }
    return '';
  }


  convertHealthInsuranceByCode(code: string) {
    if (code == '01') {
      return '健康保険組合';
    } else if (code == '02') {
      return '協会けんぽ';
    } else if (code == '03') {
      return '建設国保';
    } else if (code == '04') {
      return '国民健康保険';
    } else if (code == '05') {
      return '適用除外';
    }
    return '';
  }


  convertSpecialMedicalExaminationTypeByCode(code: string) {
    if (code == '01') {
      return '有機溶剤健康診断';
    } else if (code == '02') {
      return '特定化学物質健康診断';
    } else if (code == '03') {
      return '鉛健康診断';
    } else if (code == '04') {
      return 'じん肺健康診断';
    } else if (code == '05') {
      return '石綿健康診断';
    } else if (code == '06') {
      return '四アルキル鉛健康診断';
    } else if (code == '07') {
      return '電離放射線健康診断';
    } else if (code == '08') {
      return '高気圧健康診断';
    }
    return '';
  }


  convertBloodTypeByCode(code: string) {
    if (code == '01') {
      return 'A';
    } else if (code == '02') {
      return 'B';
    } else if (code == '03') {
      return 'O';
    } else if (code == '04') {
      return 'AB';
    }
    return '';
  }


  convertBloodTypeByName(name: string) {
    if (name == 'A') {
      return '01';
    } else if (name == 'B') {
      return '02';
    } else if (name == 'O') {
      return '03';
    } else if (name == 'AB') {
      return '04';
    }
    return '';
  }


  convertWorkerAttributeByCodes(codes: string[]) {
    let result = []
    if (codes == null) {
      return "";
    }
    codes.forEach((code: string) => {
      if (code == '01') {
        result.push('現');
      } else if (code == '02') {
        result.push('主正');
      } else if (code == '03') {
        result.push('主副');
      } else if (code == '04') {
        result.push('女');
      } else if (code == '05') {
        result.push('未');
      } else if (code == '06') {
        result.push('基');
      } else if (code == '07') {
        result.push('技');
      } else if (code == '08') {
        result.push('職');
      } else if (code == '09') {
        result.push('安');
      } else if (code == '10') {
        result.push('能');
      } else if (code == '11') {
        result.push('再');
      } else if (code == '12') {
        result.push('習');
      } else if (code == '13') {
        result.push('就');
      }
    });
    return result.join(",");
  }

  toJapaneseCalendar(dateStr: string, yearList: ListItemDto[]) {
    if (dateStr != null) {
      let parts = dateStr.split("-");
      let jpYear = yearList.find(item => item.code === parts[0]);
      if (jpYear != null) {
        return jpYear.name + "年" + parts[1] + "月" + parts[2] + "日";
      }
    }
    return "";
  }

}

export default new StringUtils()