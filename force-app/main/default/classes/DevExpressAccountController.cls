public class DevExpressAccountController {
	@auraEnabled
	public static List<Account> getAccountsData() {
		List<Account> lstAccs = [Select Name,Rating,Phone,Industry From Account];
		return lstAccs;
	}
}