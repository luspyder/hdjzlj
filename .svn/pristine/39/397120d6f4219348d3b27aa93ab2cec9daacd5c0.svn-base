package cn.slkj.jzlj.exlive;

import cn.slkj.util.JSONUtils;
import cn.slkj.util.LogUtil;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.util.EntityUtils;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by maxh on 2016-11-15.
 * 调用exlive平台数据接口
 */
public class ExliveAPI {
    private String sgUrl = "http://vip4.exlive.cn/synthReports/mobile_to_synth/zdyloginAction_autologin.action?";
    // 根据车牌号模糊查询
    private String veUrl = "http://vip4.exlive.cn/synthReports/mobile_to_synth/mobileTosynthAction_find.action?tableName=vehicle";
    private static String clientUrl = "http://vip4.exlive.cn/synthReports/mobile_to_synth/mobileTosynthAction_find.action?tableName=client";

    public ExliveAPI() {
    }

    public ExliveAPI(String userName, String userPwd) {
        this.sgUrl = sgUrl + "puser.userName=" + userName + "&puser.userPwd=" + userPwd + "&puser.serverId=10376&pt=1";
    }

    /**
     * 获取企业平台分组数据
     * @return
     */
    public String getClient() {
        try {
            return toExlive(sgUrl, clientUrl);
        } catch (Exception e) {
            LogUtil.getLogger().error("请求通信失败", e);
            e.printStackTrace();
        }
        return null;
    }

    public String getVehicle(String url) {
        try {
//            veUrl += "vehicle.ClientId="+ClientId+"&exkey=";
            veUrl += url;
            return toExlive(sgUrl, veUrl);
        } catch (Exception e) {
            LogUtil.getLogger().error("请求通信失败", e);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * @param keyUrl  获取登录exkey
     * @param dataUrl 获取数据url
     * @return 字符串
     * @throws Exception
     */
    private String toExlive(String keyUrl, String dataUrl) throws Exception {
        String respContent = "通信失败"; // 响应内容
        DefaultHttpClient httpclient = new DefaultHttpClient(new ThreadSafeClientConnManager());
        try {

            HttpPost httpost = new HttpPost(keyUrl);
            // 添加参数
            List<NameValuePair> nvps = new ArrayList<NameValuePair>();
            //设置请求的编码格式
            httpost.setEntity(new UrlEncodedFormEntity(nvps, Consts.UTF_8));
            //登录一遍
            HttpResponse response = httpclient.execute(httpost); // 执行GET请求
            HttpEntity entity = response.getEntity(); // 获取响应实体
            if (null != entity) {
                Charset respCharset = ContentType.getOrDefault(entity).getCharset();
                respContent = EntityUtils.toString(entity, respCharset);
                EntityUtils.consume(entity);
            }

            HashMap map = JSONUtils.toHashMap(respContent);
//            System.out.println("============url1===================");
//            System.out.println("===" + map.get("exkey"));
//            System.out.println("===============================");
            //然后再第二次请求普通的url即可。
            httpost = new HttpPost(dataUrl + "&exkey=" + map.get("ekey"));
            BasicResponseHandler responseHandler = new BasicResponseHandler();
//            System.out.println(httpclient.execute(httpost, responseHandler));
            return httpclient.execute(httpost, responseHandler);
        } finally {
            // 关闭请求
            httpclient.getConnectionManager().shutdown();
        }
    }


}
