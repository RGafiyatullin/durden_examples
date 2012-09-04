
using System;
using PB.Client;

namespace PB.CLI {
	public class Program {
		public static int Main(string[] args) {
			var pb = new PhoneBookAPI();
			var pbId = pb.PBCreate();
			Console.WriteLine("PB ID: {0} [{1}]", pbId, pbId.GetType() );
			var tree = pb.TreeGetDeep( pbId );
			Console.WriteLine("PB: {0}", tree);
			return 0;
		}
	}
}
