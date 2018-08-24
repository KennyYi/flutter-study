import 'package:flutter/material.dart';
import 'Picture.dart';

class PictureController extends WidgetsBindingObserver {

    var _pictures = List<Picture>();

    static PictureController _instance;

    static PictureController getInstance() {

        if (_instance == null) {
            _instance = PictureController();
        }

        return _instance;
    }

    PictureController() {

        _createDummy();
    }

    List<Picture> getPictures() {

        return _pictures;
    }

    Picture getPicture(int index) {

        if (index < _pictures.length) {
            return _pictures[index];
        }

        return null;
    }

    int getPictureCount() {

        return _pictures.length;
    }

    _createDummy() {

        _pictures.add(new Picture(path: "https://img.youtube.com/vi/BzYnNdJhZQw/0.jpg", user: "IU", userIcon: "https://yt3.ggpht.com/-7jB5DCruPMM/AAAAAAAAAAI/AAAAAAAAAAA/OXomesN1YaM/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/Fm5iP0S1z9w/0.jpg", user: "TWICE", userIcon: "https://yt3.ggpht.com/-AsxbpxU0yYY/AAAAAAAAAAI/AAAAAAAAAAA/fn7jpICg8xQ/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/UOmolLOQ7Rs/0.jpg", user: "PRODUCE 48", userIcon: "https://pbs.twimg.com/profile_images/995612387997724675/8YsImw08_400x400.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/IHNzOHi8sJs/0.jpg", user: "BLACKPINK", userIcon: "https://yt3.ggpht.com/-tdZKsWz96d8/AAAAAAAAAAI/AAAAAAAAAAA/501lIgRS5xY/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://0.soompi.io/wp-content/uploads/2015/12/24081903/red-velvet-dumb-dumb-dumb1.jpg", user: "REDVELVET", userIcon: "https://pbs.twimg.com/profile_images/950063385520951296/Qc4KG0qa.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/fj6iDHciEmA/0.jpg", user: "AKB48", userIcon: "https://yt3.ggpht.com/-9725XdkVLbU/AAAAAAAAAAI/AAAAAAAAAAA/gb9gO43mzDY/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://i.ytimg.com/vi/d6kdbj42cN4/maxresdefault.jpg", user: "나라", userIcon: "http://cfile29.uf.tistory.com/image/2639634E58133BBA34A67A"));
        _pictures.add(new Picture(path: "https://pbs.twimg.com/profile_images/745721116803510272/ve5s5YzG_400x400.jpg", user: "박소담", userIcon: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG1YMQlak3fP7-dZ8rQ70QSv3rbbmNNdBgLBuePNVSEp4fjci4"));
    }
}