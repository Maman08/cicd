import unittest
from app import app

class AppTest(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertIn('message', response.get_json())

if __name__ == '__main__':
    unittest.main()
