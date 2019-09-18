import CryptorRSA
import Base32

if #available(OSX 10.12, *) {
    
    print("*** Bartender 3 KeyMaker ***")
    
    let publicKeyPEM = """
-----BEGIN PUBLIC KEY-----
MIHwMA0GCSqGSIb3DQEBAQUAA4HeADCB2gKB0i4NHp5du5mNFuKif70Ra4Au7d3s
5id3pgD5X7IO6oRtDvIqWYVFON2iY01T48hUxN8BCHpbt575PAhT0cV2mUeeElNW
QxhhXo2VcP98wlbzvTM4+jnwytK7kqNQINjyuxJucm9/Ak7VuIrZpvAR72UHN2dz
FGKEie4liTy4u7/rYAqlWTjp5GvPgkk9Fspdisjm8MSxpv8q+bO6cY3sUXfN8lHI
t3HLOOuyEYnhBJ2429xrtveKEAogxagLexmucAyo3J7CYR/D6sPwjJF/SoHykwID
AQAB
-----END PUBLIC KEY-----
"""
    
    let privateKeyPEM = """
-----BEGIN RSA PRIVATE KEY-----
MIIDyQIBAAKB0i4NHp5du5mNFuKif70Ra4Au7d3s5id3pgD5X7IO6oRtDvIqWYVF
ON2iY01T48hUxN8BCHpbt575PAhT0cV2mUeeElNWQxhhXo2VcP98wlbzvTM4+jnw
ytK7kqNQINjyuxJucm9/Ak7VuIrZpvAR72UHN2dzFGKEie4liTy4u7/rYAqlWTjp
5GvPgkk9Fspdisjm8MSxpv8q+bO6cY3sUXfN8lHIt3HLOOuyEYnhBJ2429xrtveK
EAogxagLexmucAyo3J7CYR/D6sPwjJF/SoHykwIDAQABAoHSEeoqqiL+swpvB7V9
ifi34ELhaD8bfekO3Dwm3SbuVpvyf4S4FJ9MMvRUOyXSbAGGINbPDIKXmTGOCBNL
fMzZbkHxERhyu45NcTjcn5dSJu9lAAM/XMDutjIgJoYqcRtkaRQsUnGPXUnIztPZ
S8mTiyUkOUwAyjHn5XwEam5mDj42gkrbIZk/S0THnQOdrbSZnnwcq8jmvS3g0xup
ryjOhKwe2174khAP2bD1emEM5UyygJEcsJV91NTSlqKrPbVPre5DdibGX73aWOCw
6GMv2l9RAml4eKeKZ9DIr98IJbXBIDjQaTM1HxT3ekAyWm+eiBo0qXsfvZCEOJkS
KgTzkiQ1GSh9y/N9qmixgCLKiqqsli4vHnMgwsOMnO7Lf913ELFvA7/DgOpLTOTB
lu3KLaXH+lnx6Obvsdk+6ysCaWHbutRcHcezwrQ6cO77r9IYp9xf8J6RRMqXwOGp
Gn1Qy2i5pV5KYm9wL1Mmkxr+zymTeJ964EuItPl2a/NMx7ln0UQNBU7oGG5rK1Sc
xUYWjWJGPyXA/eF80UFDryM/5nG+nA1Nb1vCOQJpFbYQ47Wv/+sKM+qv5d1Lv+ul
qeYvHiavGSQJR7XZmzIMGX1NZTbaB1cBS3BEDDm7fWhbOoOSmKKyInR5K99o9V70
eqv/GAFUW+JwZDvi7lHrpm0+TFHQTD9KHYy6et7YhOtnaz1PHLK/AmlDf1/6oh8Y
Y/FkhvrmnEvFyqPd6X76oJCmfM3Z2N4gmd3zujlKNFx5KRQ7clv9Psx9jO6icgrL
jtvlRb1n8AnC5Mz+90w2BPj1EI6uqgOYOG4E3xcnX1q+cW2Uaq8ezTCSPDs/Ia4x
yGECaTg3UbgNnQGhmrwbrtqIt+/aVjiE7UMDCl+svCvaaHHZCY1J/aRqu6JAnURU
I5qqQ46zTzJR+i9A9jryT1S11sIxuVr5hDmKC+2JA/9ogrwbYuHnCZrCx2P53Bhm
kDd2Ypk3F7cQTVgQTA==
-----END RSA PRIVATE KEY-----
"""
    
    
    let publicKey = try! CryptorRSA.createPublicKey(withPEM: publicKeyPEM)
    let privateKey = try! CryptorRSA.createPrivateKey(withPEM: privateKeyPEM)

    print("Please input your name: ", separator: "", terminator: "")
    let userName = readLine() ?? "tree_fly"
    
    let data = "Bartender2,\(userName)".data(using: String.Encoding.utf8)!
    let plainText = CryptorRSA.createPlaintext(with: data)
    
   
    
    let signature = try plainText.signed(with: privateKey, algorithm: .sha1)!

    let verification = try plainText.verify(with: publicKey, signature: signature, algorithm: .sha1)
    print("Key Verification: ", verification)

    let signBase32String = signature.data.base32EncodedString
    
    print("\nName:", userName)
    print("SN:", signBase32String)

    
    
} else {
    print("ERROR(OSX NEED 10.12+)")
}
