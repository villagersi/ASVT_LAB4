MPI.Environment.Run(ref args, communicator =>
{
    Console.WriteLine($"MPi: Rank={communicator.Rank}, Size={communicator.Size}");
});