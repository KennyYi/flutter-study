import 'package:flutter/foundation.dart';
import 'dart:core';

class Picture {

    final String path;
    final String user;
    final String userIcon;

    const Picture({
        @required this.path,
        @required this.user,
        this.userIcon:"",
    });
}