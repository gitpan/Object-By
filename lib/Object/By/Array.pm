package Object::By::Array;
use strict;
use warnings;

sub THIS() { 0 }
sub _lock { # locks the structure (number of elements)
	Internals::SvREADONLY(@{$_[THIS]}, 1);
	return;
}
sub _unlock { # locks the structure (number of elements)
	Internals::SvREADONLY(@{$_[THIS]}, 0);
	return;
}

sub new {
	my $this = bless([], shift);
	$this->_init(@_) if ($this->can('_init'));
	$this->_lock();

	return($this);
}

sub same {
	my $this = bless([], ref(shift));
	$this->_init(@_) if ($this->can('_init'));
	$this->_lock();

	return($this);
}

sub prototype {
	return(bless([], shift));
}

sub clone {
	my $clon = [@{$_[THIS]}];
	bless($clon, ref($_[THIS]));
	$clon->_lock();

	return($clon);
}

sub P_NAME() { 1 }
sub P_VALUE() { 2 }
sub _generic_accessor {
	return(($#_ == 1) ? $_[THIS][$_[P_NAME]] : ($_[THIS][$_[P_NAME]] = $_[P_VALUE]));
};

1;
