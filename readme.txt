# WannaCry/Wcry/WannaCrypt0r
WannaCry (or WannaCrypt, WanaCrypt0r 2.0, Wanna Decryptor) is a ransomware program targeting the Microsoft Windows operating system. On Friday, 12 May 2017, a large cyber-attack was launched using it, infecting more than 230,000 computers in 150 countries, demanding ransom payments in the cryptocurrency Bitcoin in 28 languages. The attack has been described by Europol as unprecedented in scale.

# What does wcryptProfit.ps1 do?
Everyone can view a balance of a Bitcoin-wallet. This script will fetch balance and the total amount of transactions made to, and from, a wallet. These wallets in particular are wallets owned by, the so called, "hackers". 

When script is being run, blockchain.info is being queried. Script will fetch two things:
- total_received (BTC sent to wallet)
- n_transactions (total transactions to wallet)

The script will then add the total_received variable (for all wallets) and combine them. Calculating the total profit. Later on (row 21) coinmarketcap.com is being queried. It'll fetch the current price for 1 BTC and multiply it with the total amount of BTC in all 5 wallets. Showing both total received BTC and USD. 

# How to use it
Simply clone this project (or copy code, anything works really):
```sh
git clone https://github.com/dunderrrrrr/wcryptProfit.git
```
And running is simple:
```sh
PS C:\temp> .\wcryptProfit.ps1
Address: 12t9YDPgwueZ9NyMgw519p7AA8isjr6SMw
Transactions: 70
Current balance: 11.65659384 BTC

Address: 115p7UMMngoj1pMvkpHijcRdfJNXj6LrLn
Transactions: 66
Current balance: 8.74393075 BTC

Address: 13AM4VW2dhxYgXeQepoHkHSQuy6NgaEb94
Transactions: 81
Current balance: 12.06016818 BTC

Address: 1QAc9S5EmycqjzzWDc1yiWzr9jJLC8sLiY
Transactions: 12
Current balance: 3.25249956 BTC

Address: 15zGqZCTcys6eCjDkE3DypCjXi6QWRV6V1
Transactions: 5
Current balance: 1.09469717 BTC

TOTAL BTC RECEIVED: 36.8078895 BTC
TOTAL USD RECEIVED: 64047 USD
```

# Troubleshooting
The only thing that can go wrong is if you have wrong Powershell ExecutionPolicy. Error will show something like this:
```cannot be loaded because the execution of scripts is disabled on this system.``` 

More information:
- https://stackoverflow.com/questions/4037939/powershell-says-execution-of-scripts-is-disabled-on-this-system
- https://msdn.microsoft.com/en-us/powershell/reference/5.1/microsoft.powershell.security/set-executionpolicy

To fix this, first run Powershell as administrator. Run (it's completely safe, really, it is): 
```sh
PS C:\temp> Set-ExecutionPolicy RemoteSigned
```
Try run script again and it should be fine.

Created by @guldfiskhen
Inspired by @sp4rk2_