package jp.co.orangeeeee.f.form;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import jp.co.orageeeee.bean.KintaiBean;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class FInputForm extends ActionForm {

	@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {

		super.reset(mapping, request);

		String strKinmListSize = request.getParameter("kinmBeanListSize");

		if(strKinmListSize != null) {

			//listのマッピングを設定する。
			int kinmListSize = Integer.parseInt((String)request.getParameter("kinmBeanListSize"));

			List<KintaiBean> tmpKinmBeanList = new ArrayList<KintaiBean>();

			for(int i=0; i < kinmListSize; i++) {

				tmpKinmBeanList.add(new KintaiBean());
			}
			kinmBeanList = tmpKinmBeanList;
		}
	}

	/** 入力者の名前 */
	private String name;

	List<KintaiBean> kinmBeanList;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<KintaiBean> getKinmBeanList() {
		return kinmBeanList;
	}

	public void setKinmBeanList(List<KintaiBean> kinmBeanList) {
		this.kinmBeanList = kinmBeanList;
	}

	/**
	 * バリデーション
	 */
	@Override
	public ActionErrors validate(ActionMapping arg0, ServletRequest arg1) {


		return super.validate(arg0, arg1);
	}

}
