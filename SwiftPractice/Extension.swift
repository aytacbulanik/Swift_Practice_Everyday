//
//  Extension.swift
//  SwiftPractice
//
//  Created by Aytaç Bulanık on 28.12.2024.
//

import Foundation

extension Error {
    var localizedFirebaseError: String {
        let errorCode = (self as NSError).code
        
        switch errorCode {
        // Auth Errors
        case 17020:
            return "Ağ bağlantısı hatası. Lütfen internet bağlantınızı kontrol edin."
        case 17004:
            return "Geçersiz e-posta adresi. Lütfen kontrol edip tekrar deneyin."
        case 17005:
            return "E-posta adresi başka bir hesap tarafından kullanılıyor."
        case 17008:
            return "E-posta adresi veya şifre hatalı."
        case 17009:
            return "Girdiğiniz e-posta adresi ile kayıtlı bir hesap bulunamadı."
        case 17026:
            return "Şifre çok zayıf. Lütfen daha güçlü bir şifre seçin."
        case 17007:
            return "Şifre en az 6 karakter olmalıdır."
        case 17011:
            return "Kullanıcı bulunamadı."
        case 17012:
            return "Bu e-posta adresi ile zaten bir hesap var."
        case 17010:
            return "Bu hesap devre dışı bırakılmış."
            
        // Firestore Errors
        case 7:
            return "İzin hatası. Bu işlem için yetkiniz yok."
        case 13:
            return "Kimlik doğrulama hatası. Lütfen tekrar giriş yapın."
        case 14:
            return "İstemci ağ bağlantısı kesildi."
        case 2:
            return "Sunucuya ulaşılamıyor. Lütfen daha sonra tekrar deneyin."
        case 4:
            return "Zaman aşımı. Lütfen tekrar deneyin."
            
        default:
            return "Bir hata oluştu: \(self.localizedDescription)"
        }
    }
    
    
    
}
