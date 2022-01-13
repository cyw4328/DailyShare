package com.daily.share.dao;

import java.util.HashMap;

public interface HjwDAO {

	String login(String userId, String userPass);

	String IdS(String userName, String userPhone, String userEmail);

	String PwS(String userId, String userName, String userPhone, String userEmail);


	
	

}
