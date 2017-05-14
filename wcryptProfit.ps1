$blockchainUri = "https://blockchain.info/address/"
$wallets = @("12t9YDPgwueZ9NyMgw519p7AA8isjr6SMw","115p7UMMngoj1pMvkpHijcRdfJNXj6LrLn","13AM4VW2dhxYgXeQepoHkHSQuy6NgaEb94")

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