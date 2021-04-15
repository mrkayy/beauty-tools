// To parse this JSON data, do
//
//     final ApiResponseGeneric = ApiResponseGenericFromMap(jsonString);

class ApiResponseGeneric {
    ApiResponseGeneric({
        this.status,
        this.message,
        this.data,
    });

    final bool status;
    final String message;
    final String data;

    factory ApiResponseGeneric.fromMap(Map<String, dynamic> json) => ApiResponseGeneric(
        status: json["status"],
        message: json["message"],
        data: json["data"],
    );

    // Map<String, dynamic> toMap() => {
    //     "status": status,
    //     "message": message,
    //     "data": data,
    // };
}
