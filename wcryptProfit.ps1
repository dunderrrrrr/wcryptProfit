$blockchainUri = "https://blockchain.info/address/"
$wallets = @("12t9YDPgwueZ9NyMgw519p7AA8isjr6SMw","115p7UMMngoj1pMvkpHijcRdfJNXj6LrLn","13AM4VW2dhxYgXeQepoHkHSQuy6NgaEb94","1QAc9S5EmycqjzzWDc1yiWzr9jJLC8sLiY","15zGqZCTcys6eCjDkE3DypCjXi6QWRV6V1")

$btctotal = 0;
foreach ($wallet in $wallets) {
	$fetchUri = $blockchainUri + $wallet
	$fetchWallet = Invoke-WebRequest -Uri $fetchUri
	$balance = ($fetchWallet.ParsedHtml.getElementsByTagName("td") | Where{ $_.id -eq "total_received" } ).innerText
	$transactions = ($fetchWallet.ParsedHtml.getElementsByTagName("td") | Where{ $_.id -eq "n_transactions" } ).innerText
	
	Write-Host "Address: $wallet"
	Write-Host "Transactions: $transactions"
	Write-Host "Current balance: $balance `n"
	
	$balance = $balance -Replace "BTC"
	$btctotal+= $balance
	
}
Write-Host "TOTAL BTC RECEIVED: $btctotal BTC" -Foreground "green"

$coins = Invoke-RestMethod -Method Get -Uri "https://api.coinmarketcap.com/v1/ticker/"
ForEach ($coin in $coins) {
  [int]$rank = $coin.rank
  If ($rank -lt "2")	{
	$price = $coin.price_usd
	$price = $price.Substring(0, $price.IndexOf('.'))
	$btcPriceUsd = [int]$price * [int]$btctotal
  }
}
Write-Host "TOTAL USD RECEIVED: $btcPriceUsd USD" -Foreground "green" 

