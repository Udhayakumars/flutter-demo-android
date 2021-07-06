class UserLogin {
  final String FullName;
  final int UserID;
  final String userName;
  final int userTypeID;
  final String access_token;
  final String token_type;
  final bool isValidUser;
  final bool IsMobile;

  UserLogin({this.FullName, this.UserID, this.userName, this.userTypeID, this.access_token, this.token_type, this.isValidUser, this.IsMobile});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      FullName: json['FullName'],
      UserID: json['UserID'],
      userName: json['userName'],
      userTypeID: json['userTypeID'],
      access_token: json['access_token'],
      token_type: json['token_type'],
      isValidUser: json['isValidUser'],
      IsMobile: json['IsMobile'],
    );
  }
}

//TY':1,'PC':0,'CL':1239,'TI':1,'UI':true


// "FullName": " Demonstration User: Demo10",
// "UserID": 10,
// "userName": "dtalken@meqlib.com",
// "Password": null,
// "userTypeID": 0,
// "access_token": "pYO3EkY8IGnBGHm0CLGXbFPrJI56cLQmfSWvLt4217r7OaWBHbQRqPHaf7MjLIzmGLLJAKDgLUycN2v4t2zNEe_zwVDZpMNYgyPJodF8JXFi1d4Ah1bqkBqmnVameS9l4KfR8PRzoOH9p6VehvWYkB2ztTb93kTTF5NEpIFv9a6859qnLlwHvdbwgwB5HeZQk900aRm2BJTBplnW1LLjdJ416a5yzX_v4h0KqHvQrgwX8pt6u3VkD8rubnYLKZqG-g5VZI2txveVk3QIK5dyqMtZfk5DBHFJHHBej7u8ZJlKHZeFsUrovg_2Ib9QhbZhZYFaqYb9tPFyb1OBq2PNH7vnJ_lDbB6l1BY-LsGarXpYoXXJ2Dv4eUM36iHY8KBbfH9lWeDbAwcmFlSL4J3vQbcwTy_GhXBrn3aP_kKXHtZXjszpLdNrYJnsMutZiey3t5CTcvzb4qqMDn6_9T_mhRZEUEnF23WunQy8xruktwVu0tpiiwH-2ErUX_bvVS3l",
// "token_type": "bearer",
// "expires_in": "1209599",
// "refresh_token": null,
// "accessToken": null,
// "isValidUser": true,
// "IsMobile": false

