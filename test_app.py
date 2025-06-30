import unittest
from app import app

class TestApp(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home(self):
        res = self.client.get('/')
        self.assertEqual(res.status_code, 200)

    def test_health(self):
        res = self.client.get('/health')
        self.assertEqual(res.status_code, 200)

if __name__ == '__main__':
    unittest.main()
