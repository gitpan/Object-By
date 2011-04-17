package Object::By::Scalar;
use strict;
use warnings;

#sub _lock { # no structure to lock
#}

sub THIS() { 0 }

sub P_CLASS() { 0 }
sub new {
	my $value = undef;
	my $this = bless(\$value, shift);
	$this->_init(@_) if ($this->can('_init'));
	return($this);
}

sub same {
	my $value = undef;
	my $this = bless(\$value, ref(shift));
	$this->_init(@_) if ($this->can('_init'));
	return($this);
}

sub P_VALUE() { 1 }
sub _init {
	${$_[THIS]} = $_[P_VALUE] if (exists($_[P_VALUE]));
	return;
}
sub value {
	return(${$_[THIS]});
}
sub set {
	${$_[THIS]} = $_[P_VALUE];
	return;
};
sub is_WNT {
	return(${$_[THIS]} == $_[P_VALUE]);
};
sub is_WST {
	return(${$_[THIS]} eq $_[P_VALUE]);
};
sub equals {
	return(${$_[THIS]} == ${$_[P_VALUE]});
};

sub prototype {
	my $value = undef;
	return(bless(\$value, $_[P_CLASS]));
}

sub clone {
	my $value = scalar(${$_[THIS]});
	my $clon = bless(\$value, ref($_[THIS]));
	return($clon);
}

1;
