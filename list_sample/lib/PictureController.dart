import 'package:flutter/material.dart';
import 'Picture.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class PictureController extends WidgetsBindingObserver {

    var _callbacks = Set<VoidCallback>();
    var _pictures = List<Picture>();
    var isLoadingComplete = false;

    static PictureController _instance;

    static PictureController getInstance() {

        if (_instance == null) {
            _instance = PictureController();
        }

        return _instance;
    }

    PictureController() {
        print("[PictureController]");

//        _createDummy();
        load();
    }

    void registCallback(VoidCallback callback) => _callbacks.add(callback);

    void unregistCallback(VoidCallback callback) => _callbacks.remove(callback);

    void clearCallbacks() => _callbacks.clear();

    List<Picture> getPictures() {

        print("==================");
        for (var picture in _pictures) {
            print("-  ${picture.user}");
        }

        return _pictures;
    }

    Picture getPicture(int index) {
        if (index < _pictures.length) return _pictures[index];
        return null;
    }

    void reorder(int oldIndex, int newIndex) {

        var picture = _pictures[oldIndex];
        _pictures.removeAt(oldIndex);

        if (newIndex >= _pictures.length) {
            _pictures.add(picture);
        } else {
            _pictures.insert(newIndex, picture);
        }
    }

    int getPictureCount() {
        return _pictures.length;
    }

    load() async {

        await Firestore.instance.collection("SampleData")
            .getDocuments().then((snapshot) =>
            snapshot.documents.forEach((documentSnapshot) => _create(documentSnapshot))
        ).whenComplete(() {
            isLoadingComplete = true;
            _callbacks.forEach((callback) => callback());
        });
    }

    _create(DocumentSnapshot document) {

        var picture = new Picture(
            path: document.data["thumbnail"],
            user: document.data["artist"],
            description: document.data["description"],
            userIcon: document.data["userIcon"]
        );

        _pictures.add(picture);
    }

    _createDummy() {

        _pictures.add(new Picture(path: "https://img.youtube.com/vi/BzYnNdJhZQw/0.jpg", user: "IU",
            description: "The Korean best singer",
            userIcon: "https://yt3.ggpht.com/-7jB5DCruPMM/AAAAAAAAAAI/AAAAAAAAAAA/OXomesN1YaM/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/Fm5iP0S1z9w/0.jpg", user: "TWICE",
            description: "Lovely girls",
            userIcon: "https://yt3.ggpht.com/-AsxbpxU0yYY/AAAAAAAAAAI/AAAAAAAAAAA/fn7jpICg8xQ/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/UOmolLOQ7Rs/0.jpg", user: "PRODUCE 48",
            description: "Who's the winner?",
            userIcon: "https://pbs.twimg.com/profile_images/995612387997724675/8YsImw08_400x400.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/IHNzOHi8sJs/0.jpg", user: "BLACKPINK",
            description: "Chic and charas",
            userIcon: "https://yt3.ggpht.com/-tdZKsWz96d8/AAAAAAAAAAI/AAAAAAAAAAA/501lIgRS5xY/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/d9IxdwEFk1c/0.jpg", user: "IU",
            description: "The Korean best singer",
            userIcon: "https://yt3.ggpht.com/-7jB5DCruPMM/AAAAAAAAAAI/AAAAAAAAAAA/OXomesN1YaM/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://0.soompi.io/wp-content/uploads/2015/12/24081903/red-velvet-dumb-dumb-dumb1.jpg", user: "REDVELVET",
            description: "Red Flavor!",
            userIcon: "https://pbs.twimg.com/profile_images/950063385520951296/Qc4KG0qa.jpg"));
        _pictures.add(new Picture(path: "https://img.youtube.com/vi/fj6iDHciEmA/0.jpg", user: "AKB48",
            description: "Japanese top idols",
            userIcon: "https://yt3.ggpht.com/-9725XdkVLbU/AAAAAAAAAAI/AAAAAAAAAAA/gb9gO43mzDY/s288-mo-c-c0xffffffff-rj-k-no/photo.jpg"));
        _pictures.add(new Picture(path: "https://i.ytimg.com/vi/d6kdbj42cN4/maxresdefault.jpg", user: "나라",
            description: "Hello! Venus!",
            userIcon: "http://cfile29.uf.tistory.com/image/2639634E58133BBA34A67A"));
        _pictures.add(new Picture(path: "https://pbs.twimg.com/profile_images/745721116803510272/ve5s5YzG_400x400.jpg", user: "박소담",
            description: "Korean Actress",
            userIcon: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQG1YMQlak3fP7-dZ8rQ70QSv3rbbmNNdBgLBuePNVSEp4fjci4"));

        isLoadingComplete = true;
    }
}