import 'package:flutter/cupertino.dart';

const xColorDarkBlue = Color.fromRGBO(8, 19, 73, 1);
const xLogoLightBlue = Color.fromRGBO(118, 141, 255, 1);
const xLogoDarkBlue = Color.fromRGBO(37, 61, 232, 1);
const xGreyBlue = Color.fromRGBO(229, 232, 250, 1);

//
const headers = {
  "Content-Type": "application/json",
  "Accept": "application/json"
};
//

const baseURL = 'https://entree-app.herokuapp.com/';

const api = 'api/';

const userAPI = api + 'user';
const residentAPI = api + 'resident';
const staffAPI = api + 'staff';
const estateAPI = api + 'estate';
const streetAPI = api + 'street';
const houseAPI = api + 'house';
const codeAPI = api + 'code';

const registerResident = residentAPI+'/register';
const registerStaff = residentAPI+'/register';
