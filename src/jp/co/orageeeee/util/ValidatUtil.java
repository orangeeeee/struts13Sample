package jp.co.orageeeee.util;

import org.apache.commons.lang3.StringUtils;

public class ValidatUtil {


	/**
	 * 半角数値か判定する
	 * @return
	 */
	public static boolean isNumber(String val) {

		if(!StringUtils.isEmpty(val)
				&& val.matches("^[0-9]+")) {
			return true;
		}

		return false;
	}

	/**
	 * 半角英数値か判定する
	 * @return
	 */
	public static boolean isAphNumber(String val) {

		if(!StringUtils.isEmpty(val)
				&& val.matches("^[0-9A-Za-z]+")) {
			return true;
		}

		return false;
	}
}
