package jp.co.orangeeeee.f.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.orageeeee.bean.KintaiBean;
import jp.co.orangeeeee.f.form.FInputForm;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class FInitAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {

		FInputForm inputForm = (FInputForm) form;
		// create test data
		ArrayList<KintaiBean> kinmBeanList = new ArrayList<KintaiBean>();
		KintaiBean bean =  new KintaiBean();
		bean.setDetailId("1");
		bean.setPjName("プロジェクト１");
		bean.setTeam("1");
		bean.setTime("12");
		kinmBeanList.add(bean);

		inputForm.setKinmBeanList(kinmBeanList);

     return mapping.findForward("success");
    }
}
