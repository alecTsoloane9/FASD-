// To parse this JSON data, do
//
//     final fasV = fasVFromJson(jsonString);

import 'dart:convert';

List<FasV> fasVFromJson(String str) => List<FasV>.from(json.decode(str).map((x) => FasV.fromJson(x)));

String fasVToJson(List<FasV> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FasV {
    String id;
    String idRUser;
    dynamic e1;
    dynamic e2;
    dynamic e3;
    dynamic e4;
    dynamic e5;
    String name;
    String surname;
    dynamic dob;
    String phone;
    String snum;
    String gender;
    String address;
    String town;
    String ugenid;
    String producTy;
    String producNam;
    String producNum;
    dynamic producTy2;
    dynamic producNam2;
    dynamic producNum2;
    String agentNa;
    String instagra;
    String timeN;
    String timeE;
    String startTrade;
    String endTrade;
    String username;
    String fullnames;
    dynamic statuC;

    FasV({
        required this.id,
        required this.idRUser,
        required this.e1,
        required this.e2,
        required this.e3,
        required this.e4,
        required this.e5,
        required this.name,
        required this.surname,
        required this.dob,
        required this.phone,
        required this.snum,
        required this.gender,
        required this.address,
        required this.town,
        required this.ugenid,
        required this.producTy,
        required this.producNam,
        required this.producNum,
        required this.producTy2,
        required this.producNam2,
        required this.producNum2,
        required this.agentNa,
        required this.instagra,
        required this.timeN,
        required this.timeE,
        required this.startTrade,
        required this.endTrade,
        required this.username,
        required this.fullnames,
        required this.statuC,
    });

    factory FasV.fromJson(Map<String, dynamic> json) => FasV(
        id: json["id"],
        idRUser: json["idRUser"],
        e1: json["e1"],
        e2: json["e2"],
        e3: json["e3"],
        e4: json["e4"],
        e5: json["e5"],
        name: json["name"],
        surname: json["surname"],
        dob: json["dob"],
        phone: json["phone"],
        snum: json["snum"],
        gender: json["gender"],
        address: json["address"],
        town: json["town"],
        ugenid: json["ugenid"],
        producTy: json["producTy"],
        producNam: json["producNam"],
        producNum: json["producNum"],
        producTy2: json["producTy2"],
        producNam2: json["producNam2"],
        producNum2: json["producNum2"],
        agentNa: json["agentNa"],
        instagra: json["instagra"],
        timeN: json["timeN"],
        timeE: json["timeE"],
        startTrade: json["startTrade"],
        endTrade: json["endTrade"],
        username: json["username"],
        fullnames: json["fullnames"],
        statuC: json["statuC"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "idRUser": idRUser,
        "e1": e1,
        "e2": e2,
        "e3": e3,
        "e4": e4,
        "e5": e5,
        "name": name,
        "surname": surname,
        "dob": dob,
        "phone": phone,
        "snum": snum,
        "gender": gender,
        "address": address,
        "town": town,
        "ugenid": ugenid,
        "producTy": producTy,
        "producNam": producNam,
        "producNum": producNum,
        "producTy2": producTy2,
        "producNam2": producNam2,
        "producNum2": producNum2,
        "agentNa": agentNa,
        "instagra": instagra,
        "timeN": timeN,
        "timeE": timeE,
        "startTrade": startTrade,
        "endTrade": endTrade,
        "username": username,
        "fullnames": fullnames,
        "statuC": statuC,
    };
}
