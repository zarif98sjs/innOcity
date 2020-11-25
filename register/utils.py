from django.contrib.auth.tokens import PasswordResetTokenGenerator
from six import text_type


class AppTokenGenerator(PasswordResetTokenGenerator):

    def _make_hash_value(self, customer, timestamp):
        return (text_type(customer.isVerified)  + text_type(customer.customer_id) + text_type(timestamp))

account_activation_token = AppTokenGenerator()