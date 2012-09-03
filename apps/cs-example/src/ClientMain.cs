using System;
using Durden.Client;

namespace Test.Client {
	public class ClientMain {
		public static int Main(string[] args) {
			var svc = new TestService();
			// /*
			var result1 = svc.StoreUser(new User() {
					ID = Guid.NewGuid(),
					Name = "Test Person",
					YearOfBirth = 1988,
					Phones = new string[]{}
				}, false);
			Console.WriteLine("Result #1: {0}", result1);
			// */

			// /*
			var result2 = svc.GetUserByID(Guid.NewGuid());
			Console.WriteLine("Result #2: {0}", result2);
			// */
			return 0;
		}
	}
}