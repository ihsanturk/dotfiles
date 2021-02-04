self: super:
with super;
{
	st = st.override {
		patches = [

			# ./patch/st-w3m-0.8.3.diff
			./patch/st-gruvbox-dark-0.8.2.diff

			./patch/st-config.diff

		];
		# conf = config.h; # FIXME
	};
}
