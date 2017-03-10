package WebService::Braintree::PayPalAccount;
use Moo;
extends 'WebService::Braintree::PaymentMethod';

sub BUILD {
  my ($self, $attributes) = @_;
  $self->set_attributes_from_hash($self, $attributes);
}

has email => ( is => 'rw' );

sub find {
  my ($class, $token) = @_;
  $class->gateway->paypal_account->find($token);
}

sub update {
  my ($class, $token, $params) = @_;
  $class->gateway->paypal_account->update($token, $params);
}

sub gateway {
  WebService::Braintree->configuration->gateway;
}

1;
