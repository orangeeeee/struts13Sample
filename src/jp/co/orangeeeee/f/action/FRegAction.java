package jp.co.orangeeeee.f.action;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.orageeeee.bean.KintaiBean;
import jp.co.orangeeeee.f.form.FInputForm;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class FRegAction extends Action {

    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) throws Exception {

		FInputForm inputForm = (FInputForm) form;
		// create test data
		List<KintaiBean> kinmBeanList = copyList(inputForm.getKinmBeanList());


		//注）ここではDB処理をしないため、ダミーのリストを返す。
		List<KintaiBean> dummyRtnList= new ArrayList<KintaiBean>();
		/**
		 * ここからの処理は、一度にSQLで処理する場合と
		 * そうでない場合で分かれる。
		 * 一度にSQLのIN句等で処理する場合、delIdリストを作っておく。
		 *
		 */
		for(KintaiBean bean : kinmBeanList) {

			//IDが存在している場合
			if(!StringUtils.isEmpty(bean.getDetailId())) {

				//update、deleteの処理を行う。
				if("1".equals(bean.getChgFlg())) {
					//更新処理
					this.update();
					dummyRtnList.add(bean);
				}else if("-1".equals(bean.getChgFlg())) {
					//削除処理
					this.delete();
				}else {
					dummyRtnList.add(bean);
				}
			}else {

				//変更フラグが立っている行のみ処理を行う。
				if("1".equals(bean.getChgFlg())) {
					//登録処理を行う。
					this.regist();
					bean.setDetailId("2");
					dummyRtnList.add(bean);
				}
			}
		}
		inputForm.setKinmBeanList(dummyRtnList);

		return mapping.findForward("success");
    }

    /**
     * 参照渡しにならないようにコピーする。
     * @param kinmBeanList
     * @return newBeanList
     */
    private List<KintaiBean> copyList(List<KintaiBean> kinmBeanList ) {

    	List<KintaiBean> newBeanList = new ArrayList<KintaiBean>();

    	for(KintaiBean bean : kinmBeanList) {

    		try {

    			KintaiBean newBean = new KintaiBean();
    			//プロパティコピー
				BeanUtils.copyProperties(newBean,bean);
				//セット
				newBeanList.add(newBean);
			} catch (IllegalAccessException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO 自動生成された catch ブロック
				e.printStackTrace();
			}
    	}

    	return newBeanList;
    }

    private void regist() {

    }
    private void update() {

    }

    private void delete() {

    }
}
