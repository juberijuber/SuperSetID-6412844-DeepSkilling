package mockito_handsons;

import org.junit.Test;
import static org.mockito.Mockito.*;
import static org.junit.Assert.assertEquals;

public class MyServiceTest {

    @Test
    public void testExternalApi() {
        ExternalApi mockApi = mock(ExternalApi.class); // Step 1
        when(mockApi.getData()).thenReturn("Mock Data"); // Step 2

        MyService service = new MyService(mockApi); // Step 3
        String result = service.fetchData(); // Step 4

        assertEquals("Mock Data", result); // Step 5
    }
}
