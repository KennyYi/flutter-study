import 'package:flutter/foundation.dart';
import 'dart:core';

class Picture {

    final String path;
    final String user;
    final String userIcon;
    final String description;

    const Picture({
        @required this.path,
        @required this.user,
        this.userIcon:"",
        this.description:"",
    });

    Key getKey() {

        print("path: $path");
        print("user: $user");
        print("userIcon: $userIcon");
        print("description: $description");

        return Key((path + user + userIcon + description).hashCode.toString());
    }
}