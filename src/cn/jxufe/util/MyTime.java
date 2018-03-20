package cn.jxufe.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MyTime {

	public Timestamp getNowTimestamp(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Timestamp tp=new Timestamp(System.currentTimeMillis());
        Calendar rightNow = Calendar.getInstance();
        rightNow.setTime(tp);
        String tp2=sdf.format(rightNow.getTime()) ;
        Timestamp reStr = null;
        try {
        	reStr= new Timestamp(sdf.parse(tp2).getTime());
        } catch (ParseException e) {
          
            e.printStackTrace();
        }
        return reStr;
	}
}
