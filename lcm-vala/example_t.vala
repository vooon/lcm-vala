
namespace Test {

	public class example_t : Lcm.IMessage {

		public uint64 some_data_u64;


		public void decode(void[] data) {
		}

		public void[] encode() {
			return new void[10];
		}

		public int _decode_no_hash(void[] data, int offset) {
			return 0;
		}

		public int _encode_no_hash(void[] data, int offset) {
			return 0;
		}

		public int _encoded_size_no_hash {
			get {
				int enc_size = 0;
				enc_size += sizeof(uint64) * 1;
				return enc_size;
			}
		}

		public static int64 _hash = _compute_hash(null);
		public int64 hash {
			get { return _hash; }
		}

		public static int64 _compute_hash(Lcm.CoreTypes.HashPtr? p) {
			unowned Lcm.CoreTypes.HashPtr? fp = p;
			for (; fp != null; fp = fp.parent) {
				if (fp.v == (void *) _compute_hash)
					return 0;
			}

			var cp = Lcm.CoreTypes.HashPtr() {
				parent = p,
				v = (void *) _compute_hash
			};

			int64 hash_ = 0xdeadfeedd00df00d +
				example_t._compute_hash(cp);

			return (hash_ << 1) + ((hash_ >> 63) & 1);
		}
	}
}
