# Customer App – Flutter (GetX)

A simple Flutter application built using GetX for state management. The app handles user login, fetches a paginated customer list, displays customer images, and shows proper error messages.

---

## APK Download

You can download the latest APK file here:  
👉 [**Download Order Management APK**](https://github.com/Zaminur151/genuine_task/releases/tag/v01.0.1)

---

## ✨ Features

- Login page
- Dashboard  
- Modal bottom sheet  
- Pagination 
- Rest API integration
- State management by GetX  
- Clean Architecture
- Proper error handling

---

## ✨ API

baseLink = "https://www.pqstec.com/InvoiceApps/Values/"  
imageBaseLink = "https://www.pqstec.com/InvoiceApps/"

Login endpoint: "LogIn?UserName=admin@gmail.com&Password=admin1234&ComId=1"  
Get Customer List endpoint: "GetCustomerList?searchquery&pageNo=1&pageSize=20&SortyBy=Balance"  
header: "Authorization" : token from login response

User Credential:  
UserName: “admin@gmail.com”  
password: “admin1234”  
comId=1 (Default)

---

## 🧑‍💻 Tech Stack

| Feature | Package |
|--------|----------|
| State Management | GetX |
| Architecture | Clean |
| Customer List | Pagination |
| Login | Login endpoint |
| Dashboard | Customer List endpoint |

---
