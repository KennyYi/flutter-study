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
}