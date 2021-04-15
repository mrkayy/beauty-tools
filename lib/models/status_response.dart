class StatusResponse {
   StatusResponse({
        this.status,
        this.message,
    });

    final bool status;
    final String message;

    factory StatusResponse.fromMap(Map<String, dynamic> json) => StatusResponse(
        status: json["status"],
        message: json["message"],
    );

    // Map<String, dynamic> toMap() => {
    //     "status": status,
    //     "message": message,
    // };
}
