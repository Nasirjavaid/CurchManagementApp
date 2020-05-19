class APIResponce<T>{

T data;
bool error;
String errorMessage;


 bool get getError => error;

 set setError(bool error) => this.error = error;

 String get getErrorMessage => errorMessage;

 set setErrorMessage(String errorMessage) => this.errorMessage = errorMessage;
APIResponce({this.data,this.errorMessage ,this.error = false});

}